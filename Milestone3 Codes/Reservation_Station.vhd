----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:05:11 10/29/2017 
-- Design Name: 
-- Module Name:    Reservation_Station - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

			
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Reservation_Station is
    Port ( OP : in  STD_LOGIC_VECTOR (1 downto 0);
			  OPo : out  STD_LOGIC_VECTOR (1 downto 0);
			  idi : in std_logic_vector( 2 downto 0);
			  CLK : in std_logic;
			  acc : in std_logic:='0';
           Qi : in STD_LOGIC_VECTOR (4 downto 0);
			  Qj : in  STD_LOGIC_VECTOR (4 downto 0);
           Qk : in  STD_LOGIC_VECTOR (4 downto 0);
           Rj : in  STD_LOGIC_VECTOR (31 downto 0);
           Rk : in  STD_LOGIC_VECTOR (31 downto 0);
           Vj : out  STD_LOGIC_VECTOR (31 downto 0);
           Vk : out  STD_LOGIC_VECTOR (31 downto 0);
			  Vi : out STD_LOGIC_VECTOR (4 downto 0);
			  ID : out STD_LOGIC_vector( 2 downto 0);			  
           BusyRs : out  STD_LOGIC:='0';
			  Sent: out STD_LOGIC;
			  BusyCTR: in STD_LOGIC);
end Reservation_Station;

architecture Behavioral of Reservation_Station is

signal temp : Std_logic_vector(31 downto 0);
signal Fk,Fj,refj,refk,accs : std_logic:='1';
type state is(Empty,state1,state2);
signal current_state, next_state : state;
constant clk_period : time := 10 ns;
begin 
Fj <= (Qj(0) or Qj(1) or Qj(2) or Qj(3) or Qj(4));  --if Fj,k 0 is ready
Fk <= (Qk(0) or Qk(1) or Qk(2) or Qk(3) or Qk(4));


refj <= not Fj;
refk <= not fk;

id<=idi;
Vi <= Qi;
Opo <= op;


process(current_state,Qi,Fk,Fj,temp,busyctr,acc)
	begin
	case current_state is
		when Empty =>					-- Wait for Any Instruction
			Sent <='0';
			BusyRs<='0';
			
			If( acc='0') then
				BusyRs<='0';
		   	next_state <= Empty;
			elsif((not(Fk or Fj)='1')) then
			
				Sent <='1';
				BusyRs<='1';
--				Vk<=RK;
--			   Vj<=Rj;
--			   temp<=Rj;
				next_state <=state2;
			else
				BusyRs<='1';
				next_state <= state1;
			end if;	
		
		when state1 =>					-- Wait For Qj=0,Qk=0
			 
			 IF ((not(Fk or Fj)='1') ) then
			 Sent<='1';
			 Vk<=RK;
			 Vj<=Rj;
			 temp<=Rj;
			 
			 next_state <= state2;
			 else
			 next_state <=state1;
			 end if;	
			
		when state2 =>					--Wait for FU to complete
				Vk<=RK;
			   Vj<=Rj;
			   temp<=Rj;
			 If(BusyCTR='1') then
					BusyRs <='0';
					Sent <='0';
					next_state<=Empty;
				else
					next_state<=state2;
				end if;	
			 
		end case;
		end process;
 	process(CLK)
	begin
		if (CLK'EVENT and CLK = '1') then
			current_state <= next_state;
		end if;
	end process;





end Behavioral;


----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:58:57 10/25/2017 
-- Design Name: 
-- Module Name:    Functional_Unit_Arithmetic - Behavioral 
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
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;
use ieee.std_logic_arith.all;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Functional_Unit_Arithmetic is
  Port (   Grant : in  STD_LOGIC;
			  Req : out STD_LOGIC;
			  busyRs : in STD_LOGIC;
           Data : out  STD_LOGIC_VECTOR (31 downto 0);
			  Vi : in std_logic_vector ( 4 downto 0);
           Vk : in  STD_LOGIC_VECTOR (31 downto 0);
			  Vj : in  STD_LOGIC_VECTOR (31 downto 0);
           Op : in  STD_LOGIC_VECTOR (1 downto 0);
			  RSid : out std_logic_vector (4 downto 0);
			  CLK: in STD_LOGIC;
			  Tagin : in  STD_LOGIC_VECTOR (2 downto 0);
			  Busy : out STD_LOGIC;
           Tagout : out  STD_LOGIC_VECTOR (4 downto 0));
end Functional_Unit_Arithmetic;

architecture Behavioral of Functional_Unit_Arithmetic is

component Reg32 is
   Port    (Data : in  STD_LOGIC_VECTOR (31 downto 0);
           clk : in  STD_LOGIC;
           WE : in  STD_LOGIC;
           Dout : out  STD_LOGIC_VECTOR (31 downto 0));
end component;


type state is(Reset,state1,state2,state3);
signal Temp : std_logic_vector (31 downto 0);
signal current_state, next_state : state;


begin

Rsid <= "00"&tagin;
Tagout <= Vi;

temp <= Vj + Vk when op = "00" 	
			 else Vj - Vk when op = "01"
			 else "00000000000000000000000000000000";
									
process(current_state,busyRS,grant,Vj,Vk,Vi,op)
	begin
	case current_state is
		when Reset =>
			Req <='0';
			Busy <= '0';
			data <= "00000000000000000000000000000000";
			If(busyRS='0') then
				next_state <= Reset;
			else
				--Busy<= '1';
				next_state <=state1;
			end if;		
		when state1 =>
			 Busy<= '1';
			 Req <='0';
			 next_state <= state2;
			
		when state2 =>
			 Busy<= '0';
			-- Req <='1';
			 next_state <= state3;
			 
		when state3 =>
			  Req <='1';
			 If(grant='1' and busyRS='1') then
			   data <= temp;
				--Req <='0';
			   busy <= '0';
				next_state <= state1;
			elsif(grant='1' and busyRs='0') then
				data <= temp;
				busy <='1';
				next_state <= reset;
			else
				next_state <=state3;
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


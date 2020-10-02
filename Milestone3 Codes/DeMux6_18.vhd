----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:44:12 11/14/2017 
-- Design Name: 
-- Module Name:    Demux6_18 - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity DeMux6_18 is
  Port (   Fop : in  STD_LOGIC_VECTOR (1 downto 0);
			  CLK : in STD_LOGIC;
           Ri : in  STD_LOGIC_VECTOR (4 downto 0);
           A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           Qj : in  STD_LOGIC_VECTOR (4 downto 0);
           Qk : in  STD_LOGIC_VECTOR (4 downto 0);
			  Issue_Acc : in STD_LOGIC;
			  Fopout1 : out  STD_LOGIC_VECTOR (1 downto 0);
           Riout1 : out  STD_LOGIC_VECTOR (4 downto 0);
           Aout1 : out  STD_LOGIC_VECTOR (31 downto 0);
           Bout1 : out  STD_LOGIC_VECTOR (31 downto 0);
           Qjout1 : out  STD_LOGIC_VECTOR (4 downto 0);
           Qkout1 : out STD_LOGIC_VECTOR (4 downto 0);
			  Fopout2 : out  STD_LOGIC_VECTOR (1 downto 0);
           Riout2 : out  STD_LOGIC_VECTOR (4 downto 0);
           Aout2 : out  STD_LOGIC_VECTOR (31 downto 0);
           Bout2 : out  STD_LOGIC_VECTOR (31 downto 0);
           Qjout2 : out  STD_LOGIC_VECTOR (4 downto 0);
           Qkout2 : out STD_LOGIC_VECTOR (4 downto 0);
			  Fopout3 : out  STD_LOGIC_VECTOR (1 downto 0);
           Riout3 : out  STD_LOGIC_VECTOR (4 downto 0);
           Aout3 : out  STD_LOGIC_VECTOR (31 downto 0);
           Bout3 : out  STD_LOGIC_VECTOR (31 downto 0);
           Qjout3 : out  STD_LOGIC_VECTOR (4 downto 0);
           Qkout3 : out STD_LOGIC_VECTOR (4 downto 0);
			  acc1 : out std_logic:='0';
			  acc2 : out std_logic:='0';
			  acc3 : out std_logic:='0';
			  Sel : in  STD_LOGIC_Vector(1 downto 0);
			  busy1 : in std_logic:='0';
			  busy2 : in std_logic:='0');
end DeMux6_18;

architecture Behavioral of DeMux6_18 is

type state is(state2,Wait_state);
signal Temp : std_logic_vector (31 downto 0);
signal current_state, next_state : state;
begin


process(current_state,Issue_Acc,Fop,Ri,A,B,Qj,Qk,busy1,busy2)
	begin
	case current_state is
		when state2 =>
			If(Issue_Acc='1' ) then
				Fopout1 <=Fop;
				Riout1 <= Ri;
				Aout1 <=A;
				Bout1 <=B;
				Qjout1 <=Qj;
				Qkout1 <=Qk;
				Fopout2 <=Fop;
				Riout2 <="00000";
				Aout2 <="00000000000000000000000000000000";
				Bout2 <="00000000000000000000000000000000";
				Qjout2 <="00000";
				Qkout2 <="00000";
				acc1 <=issue_acc;
			   acc2 <='0';
--				acc3
				Fopout3 <=Fop;
				Riout3 <="00000";
				Aout3 <="00000000000000000000000000000000";
				Bout3 <="00000000000000000000000000000000";
				Qjout3 <="00000";
				Qkout3 <="00000";
				next_state<=state2;
			elsif (Issue_Acc='1' and busy2='0') then
				Fopout2 <=Fop;
				Riout2 <= Ri;
				Aout2 <=A;
				Bout2 <=B;
				Qjout2 <=Qj;
				Qkout2 <=Qk;
				Fopout1 <=Fop;
				acc2 <=issue_acc;
			   acc3 <='0';
				Riout1 <="00000";
				Aout1 <="00000000000000000000000000000000";
				Bout1 <="00000000000000000000000000000000";
				Qjout1 <="00000";
				Qkout1 <="00000";
				Fopout3 <=Fop;
				Riout3 <="00000";
				Aout3 <="00000000000000000000000000000000";
				Bout3 <="00000000000000000000000000000000";
				Qjout3 <="00000";
				Qkout3 <="00000";
				next_state<=state2;
			elsif(Issue_Acc='1') then
			   acc3 <=issue_acc;
			   acc1 <='0';
				Fopout3 <=Fop;
				Riout3 <= Ri;
				Aout3 <=A;
				Bout3 <=B;
				Qjout3 <=Qj;
				Qkout3 <=Qk;
				Fopout1 <=Fop;
				Riout1 <="00000";
				Aout1 <="00000000000000000000000000000000";
				Bout1 <="00000000000000000000000000000000";
				Qjout1 <="00000";
				Qkout1 <="00000";
				Fopout2 <=Fop;
				Riout2 <="00000";
				Aout2 <="00000000000000000000000000000000";
				Bout2 <="00000000000000000000000000000000";
				Qjout2 <="00000";
				Qkout2 <="00000";
				next_state<=state2;
			else
				next_state<=Wait_state;
			end if;
		when Wait_state =>
				next_state<=state2;
			 
		end case;
		end process;

 process(CLK)
	begin
		if (CLK'EVENT and CLK = '1') then
			current_state <= next_state;
		end if;
	end process;
end Behavioral;



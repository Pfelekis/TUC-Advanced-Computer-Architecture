----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:48:08 10/30/2017 
-- Design Name: 
-- Module Name:    DeMux6_18 - Behavioral 
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
  Port ( Fop : in  STD_LOGIC_VECTOR (1 downto 0);
           Ri : in  STD_LOGIC_VECTOR (4 downto 0);
           A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           Qj : in  STD_LOGIC_VECTOR (4 downto 0);
           Qk : in  STD_LOGIC_VECTOR (4 downto 0);
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
			  Sel : in  STD_LOGIC_Vector(1 downto 0));
end DeMux6_18;

architecture Behavioral of DeMux6_18 is


begin

Process(Sel,A,B)
begin
	If (Sel="00") then		--Rs num1
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
		Fopout3 <=Fop;
		Riout3 <="00000";
      Aout3 <="00000000000000000000000000000000";
      Bout3 <="00000000000000000000000000000000";
      Qjout3 <="00000";
      Qkout3 <="00000";
	elsif (Sel="01") then	---Rs num2
		Fopout2 <=Fop;
      Riout2 <= Ri;
      Aout2 <=A;
      Bout2 <=B;
      Qjout2 <=Qj;
      Qkout2 <=Qk;
		Fopout1 <=Fop;
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
	elsif (Sel="10") then		--Rs num3
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
	else		---NOP
		Fopout2 <=Fop;
		Riout2 <="00000";
      Aout2 <="00000000000000000000000000000000";
      Bout2 <="00000000000000000000000000000000";
      Qjout2 <="00000";
      Qkout2 <="00000";
		Fopout1 <=Fop;
		Riout1 <="00000";
      Aout1 <="00000000000000000000000000000000";
      Bout1 <="00000000000000000000000000000000";
      Qjout1 <="00000";
      Qkout1 <="00000";
		Fopout1 <=Fop;
		Riout1 <="00000";
      Aout1 <="00000000000000000000000000000000";
      Bout1 <="00000000000000000000000000000000";
      Qjout1 <="00000";
      Qkout1 <="00000";
		
	end if;
end process;


end Behavioral;


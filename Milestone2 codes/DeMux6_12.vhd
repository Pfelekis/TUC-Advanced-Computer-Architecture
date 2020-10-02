----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:34:51 10/30/2017 
-- Design Name: 
-- Module Name:    DeMux6_12 - Behavioral 
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

entity DeMux6_12 is
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
           Sel : in  STD_LOGIC);
end DeMux6_12;

architecture Behavioral of DeMux6_12 is

begin

process(Sel,A,B)
begin
	If (Sel='0') then		-- From FU1
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
	else	
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
	end if;
end process;


end Behavioral;


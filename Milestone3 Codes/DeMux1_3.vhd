----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:23:54 11/13/2017 
-- Design Name: 
-- Module Name:    DeMux1_3 - Behavioral 
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

entity DeMux1_3 is
  Port ( 
			  Reset : in  STD_LOGIC;
           Reset1 : out  STD_LOGIC;
           Reset2 : out  STD_LOGIC;
           Reset3 : out STD_LOGIC;
			  Sel : in  STD_LOGIC_Vector(2 downto 0));
end DeMux1_3;

architecture Behavioral of DeMux1_3 is


begin

Reset1 <= Reset when sel="011" else '0';
Reset2 <= Reset when sel="100" else '0';
Reset3 <= Reset when sel="101" else '0';

end Behavioral;




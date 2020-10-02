----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:29:02 11/16/2017 
-- Design Name: 
-- Module Name:    DeMuc1_2 - Behavioral 
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

entity DeMuc1_2 is
    Port ( Reset : in  STD_LOGIC;
           Reset1 : out  STD_LOGIC;
           Reset2 : out  STD_LOGIC;
           Sel : in  STD_LOGIC_VECTOR (1 downto 0));
end DeMuc1_2;

architecture Behavioral of DeMuc1_2 is

begin

Reset1 <= Reset when sel="01" else '0';
Reset2 <= Reset when sel="10" else '0';

end Behavioral;


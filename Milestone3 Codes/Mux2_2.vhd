----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:22:27 11/16/2017 
-- Design Name: 
-- Module Name:    Mux2_2 - Behavioral 
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

entity Mux2_2 is
    Port ( Sel : in  STD_LOGIC;
           InM1 : in  STD_LOGIC_VECTOR (4 downto 0);
           InM2 : in  STD_LOGIC_VECTOR (4 downto 0);
           OutM : out  STD_LOGIC_VECTOR (4 downto 0));
end Mux2_2;

architecture Behavioral of Mux2_2 is

begin

OutM <= InM1 when Sel = '0' else  InM2;


end Behavioral;


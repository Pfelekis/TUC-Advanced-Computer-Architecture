----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:03:02 10/29/2017 
-- Design Name: 
-- Module Name:    MUX8x4 - Behavioral 
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

entity MUX8x4 is
    Port ( Viin1 : in  STD_LOGIC_VECTOR (4 downto 0);
           Viin2 : in  STD_LOGIC_VECTOR (4 downto 0);
           Vjin1 : in  STD_LOGIC_VECTOR (31 downto 0);
           Vjin2 : in  STD_LOGIC_VECTOR (31 downto 0);
           Vkin1 : in  STD_LOGIC_VECTOR (31 downto 0);
           Vkin2 : in  STD_LOGIC_VECTOR (31 downto 0);
           Opoin1 : in  STD_LOGIC_VECTOR (1 downto 0);
           Opoin2 : in  STD_LOGIC_VECTOR (1 downto 0);
           Idin1 : in  STD_LOGIC_VECTOR (2 downto 0);
           Idin2 : in  STD_LOGIC_VECTOR (2 downto 0);
           Vjout : out  STD_LOGIC_VECTOR (31 downto 0);
           Vkout : out  STD_LOGIC_VECTOR (31 downto 0);
           Viout : out  STD_LOGIC_VECTOR (4 downto 0);
           Opout : out  STD_LOGIC_VECTOR (1 downto 0);
           Idout : out  STD_LOGIC_VECTOR (2 downto 0);
           Sel_Busy : in  STD_LOGIC);
end MUX8x4;

architecture Behavioral of MUX8x4 is

begin

Vjout <= vjin1 when sel_busy='0' else vjin2;
Vkout <= vkin1 when sel_busy ='0' else vkin2;
Viout <= viin1 when sel_busy='0' else viin2;
Opout <= opoin1 when sel_busy='0' else opoin2;
idout <= idin1 when sel_busy='0' else idin2; 

end Behavioral;


----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:10:12 10/29/2017 
-- Design Name: 
-- Module Name:    MUX12x4 - Behavioral 
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

entity MUX12x4 is
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
			  Vjin3 : in  STD_LOGIC_VECTOR (31 downto 0);
           Vkin3 : in  STD_LOGIC_VECTOR (31 downto 0);
           Viin3 : in  STD_LOGIC_VECTOR (4 downto 0);
           Opoin3 : in  STD_LOGIC_VECTOR (1 downto 0);
           Idin3 : in  STD_LOGIC_VECTOR (2 downto 0);
           Vjout : out  STD_LOGIC_VECTOR (31 downto 0);
           Vkout : out  STD_LOGIC_VECTOR (31 downto 0);
           Viout : out  STD_LOGIC_VECTOR (4 downto 0);
           Opout : out  STD_LOGIC_VECTOR (1 downto 0);
           Idout : out  STD_LOGIC_VECTOR (2 downto 0);
           Sel_Busy1 : in  STD_LOGIC;
			  Sel_Busy2 : in  STD_LOGIC);
end MUX12x4;

architecture Behavioral of MUX12x4 is

begin

Vjout <= Vjin1 when  sel_busy1='0' else Vjin2 when sel_busy2='0' else Vjin3;
Vkout <= Vkin1 when  sel_busy1='0' else Vkin2 when sel_busy2='0' else Vkin3;
opout <= opoin1 when  sel_busy1='0' else opoin2 when sel_busy2='0' else Opoin3;
idout <= idin1 when  sel_busy1='0' else idin2 when sel_busy2='0' else idin3;
Viout <= Viin1 when  sel_busy1='0' else Viin2 when sel_busy2='0' else Viin3;
end Behavioral;


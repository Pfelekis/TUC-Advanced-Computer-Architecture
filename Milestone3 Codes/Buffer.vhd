----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:04:14 11/30/2017 
-- Design Name: 
-- Module Name:    Buffer - Behavioral 
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

entity BOB is
 Port (    RegD : in  STD_LOGIC_VECTOR (4 downto 0);
           Value : in  STD_LOGIC_VECTOR (31 downto 0);
           InstrType : in  STD_LOGIC_VECTOR (1 downto 0);
           Ready : in  STD_LOGIC;
			  clk : in STD_LOGIC;
			  WE : in std_logic;
			  En : in std_logic;
			  reset : in std_logic;
           RegDo : out  STD_LOGIC_VECTOR (4 downto 0);
           Valueo : out  STD_LOGIC_VECTOR (31 downto 0);
           InstrTypeo : out  STD_LOGIC_VECTOR (1 downto 0);
           Readyo : out  STD_LOGIC);
end BOB;

architecture Behavioral of BOB is

component Reg32 is
    Port ( Data : in  STD_LOGIC_VECTOR (31 downto 0);
           clk : in  STD_LOGIC;
           WE : in  STD_LOGIC;
           Dout : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component Reg5 is
    Port ( Data : in  STD_LOGIC_VECTOR (4 downto 0);
           CLK : in  STD_LOGIC;
           Dout : out  STD_LOGIC_VECTOR (4 downto 0);
			  reset : in std_logic;
           Enable : in  STD_LOGIC);
end component;

signal tempi,tempo : std_logic_vector(4 downto 0);

begin

tempi <= "00"&ready&instrtype;

 RegD_ROB : Reg5 port map (
			  Data => regd,
           CLK => clk,
           Dout => regdo,
			  reset => reset,
           Enable => we);

 Value_ROB : Reg32 port map (
			  Data => value,
           CLK => clk,
           Dout => valueo,
           we => en);
			  
 Ready_Type : Reg5 port map (
			  Data => tempi,
           CLK => clk,
           Dout => tempo,
			  reset => reset,
           Enable => we);
			  
Readyo <= tempo(2);
InstrTypeo <= tempo(1 downto 0);		  
			  
end Behavioral;


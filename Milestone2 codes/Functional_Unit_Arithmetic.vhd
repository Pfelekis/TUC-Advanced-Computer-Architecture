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

signal Temp1,Temp2,Temp3 : std_logic_vector (31 downto 0);

begin

temp1 <= Vj + Vk when op = "00" 	
else Vj - Vk when op = "01"
else "00000000000000000000000000000000";

Rsid <= "00"&tagin;
Tagout <= Vi;

Reg32_1 :	Reg32 port map ( Data => temp1,
						  WE => '1',
						  Clk => CLK,
						  Dout => Temp2);
						  
Reg32_2 :	Reg32 port map ( Data => Temp2,
						  WE => '1',
						  Clk => CLK,
						  Dout => Temp3);

Reg32_3 :	Reg32 port map ( Data => Temp3,
						  WE => '1',
						  Clk => CLK,
						  Dout => Data);


end Behavioral;


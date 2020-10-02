----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:14:36 10/27/2017 
-- Design Name: 
-- Module Name:    Pipeline - Behavioral 
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

entity Pipeline is
    Port ( tagin : in  STD_LOGIC_VECTOR (4 downto 0);
           resultin : in  STD_LOGIC_VECTOR (31 downto 0);
           tagout : out  STD_LOGIC_VECTOR (4 downto 0);
           resultout : out  STD_LOGIC_VECTOR (31 downto 0);
			  CLK : in STD_LOGIC);
end Pipeline;

architecture Behavioral of Pipeline is

component Reg32 is
		Port ( Data : in  STD_LOGIC_VECTOR (31 downto 0);
             CLK : in  STD_LOGIC;
             Dout : out  STD_LOGIC_VECTOR (31 downto 0);
             WE : in  STD_LOGIC);
end component;

component Reg5 is
    Port ( Data : in  STD_LOGIC_VECTOR (4 downto 0);
           CLK : in  STD_LOGIC;
           Dout : out  STD_LOGIC_VECTOR (4 downto 0);
           Enable : in  STD_LOGIC);
end component;


begin


	Result : Reg32 Port Map(CLK	=> Clk,
									Data	=> resultin,
									WE		=> '1',
									Dout	=> resultout);
	Tagg : Reg5 Port Map(   CLK	=> Clk,
									Data	=> tagin,
									Enable		=> '1',
									Dout	=> tagout);

end Behavioral;


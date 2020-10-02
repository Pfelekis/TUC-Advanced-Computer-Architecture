----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:55:36 10/26/2017 
-- Design Name: 
-- Module Name:    Reg5 - Behavioral 
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

entity Reg5 is
    Port ( Data : in  STD_LOGIC_VECTOR (4 downto 0);
           CLK : in  STD_LOGIC;
           Dout : out  STD_LOGIC_VECTOR (4 downto 0):="00000";
			  reset : in std_logic:='0';
           Enable : in  STD_LOGIC);
end Reg5;

architecture Behavioral of Reg5 is

signal temp : STD_LOGIC_VECTOR (4 downto 0);

begin

process(Clk)
begin -- process
	-- activities triggered by asynchronous reset (active high)
	if Reset = '1' then    
		Dout <= "00000";
		-- activities triggered by rising edge of clock
	elsif Clk'event and Clk = '1' then
		if Enable='1' then 
			Dout <= Data;
		else 
		null;
		end if;
	end if;
end process;



end Behavioral;


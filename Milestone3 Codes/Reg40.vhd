----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:21:22 11/29/2017 
-- Design Name: 
-- Module Name:    Reg40 - Behavioral 
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

entity Reg40 is
    Port ( Data : in  STD_LOGIC_VECTOR (39 downto 0);
           clk : in  STD_LOGIC;
           WE : in  STD_LOGIC;
           Dout : out  STD_LOGIC_VECTOR (39 downto 0));
end Reg40;

architecture Behavioral of Reg40 is
signal temp : STD_LOGIC_VECTOR (39 downto 0);
signal reset : std_logic;

begin
reset<= '0';

process(Clk)
begin -- process
	-- activities triggered by asynchronous reset (active high)
	if Reset = '1' then    
		Dout <= "0000000000000000000000000000000000000000";
		-- activities triggered by rising edge of clock
	elsif Clk'event and Clk = '1' then
		if WE='1' then 
			Dout <= Data;
		else 
		null;
		end if;
	end if;
end process;

end Behavioral;


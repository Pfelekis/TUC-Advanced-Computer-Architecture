----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:10:26 10/28/2017 
-- Design Name: 
-- Module Name:    PipeFU - Behavioral 
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

entity PipeFU is
    Port ( Viin : in  STD_LOGIC_VECTOR (4 downto 0);
           Vjin : in  STD_LOGIC_VECTOR (31 downto 0);
           Vkin : in  STD_LOGIC_VECTOR (31 downto 0);
           Opoin : in  STD_LOGIC_VECTOR (1 downto 0);
           IDin : in  STD_LOGIC_VECTOR (2 downto 0);
			  busyRsin : in STD_LOGIC;
           Viout : out  STD_LOGIC_VECTOR (4 downto 0);
           Vjout : out  STD_LOGIC_VECTOR (31 downto 0);
           Vkout : out  STD_LOGIC_VECTOR (31 downto 0);
           Opoout : out  STD_LOGIC_VECTOR (1 downto 0);
           IDout : out  STD_LOGIC_VECTOR (2 downto 0);
			  busyRs : out STD_LOGIC;
           En_Busy : in  STD_LOGIC:='1';
           clk : in  STD_LOGIC);
end PipeFU;

architecture Behavioral of PipeFU is

component Regis32 is
		Port ( Data : in  STD_LOGIC_VECTOR (31 downto 0);
           clk : in  STD_LOGIC;
           WE : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           Dout : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component Reg5 is
    Port ( Data : in  STD_LOGIC_VECTOR (4 downto 0);
           CLK : in  STD_LOGIC;
           Dout : out  STD_LOGIC_VECTOR (4 downto 0);
           Enable : in  STD_LOGIC);
end component;

signal temp1,temp2,out1,out2,bbb,bout : std_logic_vector(4 downto 0);

begin

temp1 <= "000"&opoin;
temp2 <= "00"&idin;
bbb <= "0000"&busyrsin;

	Vj: Regis32 Port Map(CLK	=> Clk,
									Data	=> Vjin,
									WE		=> en_busy,
									reset => '0',
									Dout	=> vjout);
									
   Vk: Regis32 Port Map(CLK	=> Clk,
									Data	=> Vkin,
									reset => '0',
									WE		=> en_busy,
									Dout	=> vkout);
									
									
	Vi : Reg5 Port Map(   CLK	=> Clk,
									Data	=> viin,
									Enable		=> en_busy,
									Dout	=> viout);
									
	Opo: Reg5 Port Map(   CLK	=> Clk,
									Data	=> temp1,
									Enable		=> en_busy,
									Dout	=> out1);
									
	ID : Reg5 Port Map(   CLK	=> Clk,
									Data	=> temp2,
									Enable		=> en_busy,
									Dout	=> out2);
									
	Busy : Reg5 Port Map(   CLK	=> Clk,
									Data	=> bbb,
									Enable => en_busy,
									Dout	=> bout);
									
	opoout <= out1(1 downto 0);
	idout <= out2(2 downto 0);
	busyrs <= bout(0);

end Behavioral;


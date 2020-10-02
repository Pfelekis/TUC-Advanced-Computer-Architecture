----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:05:11 10/29/2017 
-- Design Name: 
-- Module Name:    Reservation_Station - Behavioral 
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

entity Reservation_Station is
    Port ( OP : in  STD_LOGIC_VECTOR (1 downto 0);
			  OPo : out  STD_LOGIC_VECTOR (1 downto 0);
			  idi : in std_logic_vector( 2 downto 0);
			  CLK : in std_logic;
           Qi : in STD_LOGIC_VECTOR (4 downto 0);
			  Qj : in  STD_LOGIC_VECTOR (4 downto 0);
           Qk : in  STD_LOGIC_VECTOR (4 downto 0);
           Rj : in  STD_LOGIC_VECTOR (31 downto 0);
           Rk : in  STD_LOGIC_VECTOR (31 downto 0);
           Vj : out  STD_LOGIC_VECTOR (31 downto 0);
           Vk : out  STD_LOGIC_VECTOR (31 downto 0);
			  Vi : out STD_LOGIC_VECTOR (4 downto 0);
			  ID : out STD_LOGIC_vector( 2 downto 0);			  
           BUSY : out  STD_LOGIC);
end Reservation_Station;

architecture Behavioral of Reservation_Station is

component Regis32 is
		Port ( Data : in  STD_LOGIC_VECTOR (31 downto 0);
           clk : in  STD_LOGIC;
           WE : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           Dout : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

signal Fk,Fj,refj,refk : std_logic;

begin 
Fj <= (Qj(0) or Qj(1) or Qj(2) or Qj(3) or Qj(4));  --if Fj,k 0 is ready
Fk <= (Qk(0) or Qk(1) or Qk(2) or Qk(3) or Qk(4));

refj <= not Fj;
refk <= not fk;

id<=idi;
Vi <= Qi;
Opo <= op;

BUSY <= Fk or Fj;  --- not busy when 0



Vjj: Regis32 Port Map(CLK	=> Clk,
									Data	=> Rj,
									WE		=> reFj,
									reset => '0',
									Dout	=> vj);
									
Vkk: Regis32 Port Map(CLK	=> Clk,
									Data	=> rk,
									reset => '0',
									WE		=> reFk,
									Dout	=> vk);



end Behavioral;


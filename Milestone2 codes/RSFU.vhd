----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:31:34 10/29/2017 
-- Design Name: 
-- Module Name:    RSFU - Behavioral 
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

entity RSFU is
	    Port ( grantl : in STD_LOGIC;
		        granta : in STD_LOGIC;
				  CLK : in std_logic;
				  OP1 : in  STD_LOGIC_VECTOR (1 downto 0);
              Qi1 : in STD_LOGIC_VECTOR (4 downto 0);
			     Qj1 : in  STD_LOGIC_VECTOR (4 downto 0);
              Qk1 : in  STD_LOGIC_VECTOR (4 downto 0);
              Rj1 : in  STD_LOGIC_VECTOR (31 downto 0);
              Rk1 : in  STD_LOGIC_VECTOR (31 downto 0);
				  OP2 : in  STD_LOGIC_VECTOR (1 downto 0);
              Qi2 : in STD_LOGIC_VECTOR (4 downto 0);
			     Qj2 : in  STD_LOGIC_VECTOR (4 downto 0);
              Qk2 : in  STD_LOGIC_VECTOR (4 downto 0);
              Rj2 : in  STD_LOGIC_VECTOR (31 downto 0);
              Rk2 : in  STD_LOGIC_VECTOR (31 downto 0);
				  OP1a : in  STD_LOGIC_VECTOR (1 downto 0);
              Qi1a : in STD_LOGIC_VECTOR (4 downto 0);
			     Qj1a : in  STD_LOGIC_VECTOR (4 downto 0);
              Qk1a : in  STD_LOGIC_VECTOR (4 downto 0);
              Rj1a : in  STD_LOGIC_VECTOR (31 downto 0);
              Rk1a : in  STD_LOGIC_VECTOR (31 downto 0);
				  OP2a : in  STD_LOGIC_VECTOR (1 downto 0);
              Qi2a : in STD_LOGIC_VECTOR (4 downto 0);
			     Qj2a : in  STD_LOGIC_VECTOR (4 downto 0);
              Qk2a : in  STD_LOGIC_VECTOR (4 downto 0);
              Rj2a : in  STD_LOGIC_VECTOR (31 downto 0);
              Rk2a : in  STD_LOGIC_VECTOR (31 downto 0);
				  OP3a : in  STD_LOGIC_VECTOR (1 downto 0);
              Qi3a : in STD_LOGIC_VECTOR (4 downto 0);
			     Qj3a : in  STD_LOGIC_VECTOR (4 downto 0);
              Qk3a : in  STD_LOGIC_VECTOR (4 downto 0);
              Rj3a : in  STD_LOGIC_VECTOR (31 downto 0);
              Rk3a : in  STD_LOGIC_VECTOR (31 downto 0);
				  GRANTFUL : out std_logic;
				  GRANTFUA : out std_logic;
				  CDBVA : out Std_logic_vector(31 downto 0);
				  CDBVL : out std_logic_vector(31 downto 0);
				  CDBQL : out std_Logic_vector(4 downto 0);
				  CDBQA : out std_logic_vector(4 downto 0);
				  POSOFQL : out std_logic_vector(4 downto 0);
				  POSOFQA : out std_logic_vector(4 downto 0));
end RSFU;

architecture Behavioral of RSFU is

component Reservation_Station is
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
end component;

component MUX12x4 is
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
end component;
 
component MUX8x4 is
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
end component;

component Functional_Unit_Arithmetic is
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
end component;

component Functional_Unit_Logic is
    Port ( Grant : in  STD_LOGIC;
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
end component;

component PipeFU is
    Port ( Viin : in  STD_LOGIC_VECTOR (4 downto 0);
           Vjin : in  STD_LOGIC_VECTOR (31 downto 0);
           Vkin : in  STD_LOGIC_VECTOR (31 downto 0);
           Opoin : in  STD_LOGIC_VECTOR (1 downto 0);
           IDin : in  STD_LOGIC_VECTOR (2 downto 0);
           Viout : out  STD_LOGIC_VECTOR (4 downto 0);
           Vjout : out  STD_LOGIC_VECTOR (31 downto 0);
           Vkout : out  STD_LOGIC_VECTOR (31 downto 0);
           Opoout : out  STD_LOGIC_VECTOR (1 downto 0);
           IDout : out  STD_LOGIC_VECTOR (2 downto 0);
           En_Busy : in  STD_LOGIC;
           clk : in  STD_LOGIC);
end component;

signal vjin1,vjin2,vjin1a,vjin2a,vjin3a,vkin1,vkin2,vkin1a,vkin2a,vkin3a,vj,vk,vja,vka,vjtol,vktol,vjtoa,vktoa : std_logic_vector(31 downto 0);
signal viin1,viin2,viin1a,viin2a,viin3a,vi,via,vitol,vitoa : std_logic_vector(4 downto 0);
signal idin1,idin2,idin1a,idin2a,idin3a,id,ida,idtol,idtoa : std_logic_vector(2 downto 0);
signal opo1,opo2,opo1a,opo2a,opo3a,opout,opouta,opotol,opotoa : std_logic_vector( 1 downto 0);
signal busy1,busy2,busy1a,busy2a,busy3a,busyofl,nbusyofl,busyofa : std_logic;

begin

busyofl <= not(nbusyofl);

RSL1 : Reservation_Station port map (
			  OP => op1,
			  OPo => opo1,
			  idi => "001",
			  CLK => clk,
           Qi => qi1,
			  Qj => qj1,
           Qk => QK1,
           Rj => Rj1,
           Rk => Rk1,
           Vj =>vjin1,
           Vk => vkin1,
			  Vi => viin1,
			  ID => idin1,			  
           BUSY =>busy1);
			  
			  
RSL2 : Reservation_Station port map (
			  OP => op2,
			  OPo => opo2,
			  idi => "010",
			  CLK => clk,
           Qi => qi2,
			  Qj => qj2,
           Qk => QK2,
           Rj => Rj2,
           Rk => Rk2,
           Vj =>vjin2,
           Vk => vkin2,
			  Vi => viin2,
			  ID => idin2,			  
           BUSY =>busy2);
			  
RSA1 : Reservation_Station port map (
			  OP => op1a,
			  OPo => opo1a,
			  idi => "011",
			  CLK => clk,
          Qi => qi1a,
			  Qj => qj1a,
           Qk => QK1a,
           Rj => Rj1a,
           Rk => Rk1a,
           Vj =>vjin1a,
           Vk => vkin1a,
			  Vi => viin1a,
			  ID => idin1a,			  
           BUSY =>busy1a);
			  
RSA2 : Reservation_Station port map (
			  OP => op2a,
			  OPo => opo2a,
			  idi => "100",
			  CLK => clk,
           Qi => qi2a,
			  Qj => qj2a,
           Qk => QK2a,
           Rj => Rj2a,
           Rk => Rk2a,
           Vj =>vjin2a,
           Vk => vkin2a,
			  Vi => viin2a,
			  ID => idin2a,			  
           BUSY =>busy2a);
			  
RSA3 : Reservation_Station port map (
			  OP => op3a,
			  OPo => opo3a,
			  idi => "101",
			  CLK => clk,
           Qi => qi3a,
			  Qj => qj3a,
           Qk => QK3a,
           Rj => Rj3a,
           Rk => Rk3a,
           Vj =>vjin3a,
           Vk => vkin3a,
			  Vi => viin3a,
			  ID => idin3a,			  
           BUSY =>busy3a);

MUXL : MUX8x4 port map (
			  Viin1 => viin1,
           Viin2 => viin2,
           Vjin1 => vjin1,
           Vjin2 => vjin2,
           Vkin1 => vkin1,
           Vkin2 => vkin2,
           Opoin1 => opo1,
           Opoin2 => opo2,
           Idin1  => idin1,
           Idin2 => idin2,
           Vjout => vj,
           Vkout => vk,
           Viout => vi,
           Opout => opout,
           Idout => id,
           Sel_Busy => busy1); 
			  
MUXA : MUX12x4 port map (
			  Viin1 => viin1a,
           Viin2 => viin2a,
			  Viin3 => viin3a,
           Vjin1 => vjin1a,
           Vjin2 => vjin2a,
			  Vjin3 => vjin3a,
           Vkin1 => vkin1a,
           Vkin2 => vkin2a,
			  Vkin3 => vkin3a,
           Opoin1 => opo1a,
           Opoin2 => opo2a,
			  opoin3 => opo3a,
           Idin1  => idin1a,
           Idin2 => idin2a,
			  idin3 => idin3a,
           Vjout => vja,
           Vkout => vka,
           Viout => via,
           Opout => opouta,
           Idout => ida,
           Sel_Busy1 => busy1a,
			  Sel_Busy2 => busy2a);
			  
PIPEL : PipeFU port map (
			  Viin => vi,
           Vjin => vj,
           Vkin => vk,
           Opoin => opout,
           IDin => id,
           Viout => vitol,
           Vjout => vjtol,
           Vkout => vktol,
           Opoout => opotol,
           IDout => idtol,
           En_Busy => '1',
           clk =>clk);
			  
PIPEA : PipeFU port map (
			  Viin => via,
           Vjin => vja,
           Vkin => vka,
           Opoin => opouta,
           IDin => ida,
           Viout => vitoa,
           Vjout => vjtoa,
           Vkout => vktoa,
           Opoout => opotoa,
           IDout => idtoa,
           En_Busy => '1',
           clk =>clk);

FUL : Functional_Unit_Logic Port map (
			  Grant => grantl,
			  Req => GRANTFUL,
           Data => CDBVL,
			  Vi => vitol,
           Vk => vktol,
			  Vj => vjtol,
           Op => opotol,
			  RSid => CDBQL,
			  CLK => clk,
			  Tagin => idtol,
			  Busy => busyofL,
           Tagout => POSOFQL);
			  
FUA : Functional_Unit_Arithmetic Port map (
			  Grant => granta,
			  Req => GRANTFUA,
           Data => CDBVA,
			  Vi => vitoa,
           Vk => vktoa,
			  Vj => vjtoa,
           Op => opotoa,
			  RSid => CDBQA,
			  CLK => clk,
			  Tagin => idtoa,
			  Busy => busyofA,
           Tagout => POSOFQA);

end Behavioral;



library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library grlib;
use grlib.amba.all;
use grlib.stdlib.all;
use grlib.devices.all;
library gaisler;
use gaisler.misc.all;
library UNISIM;
use UNISIM.VComponents.all;


entity ahblite_bridge is
generic (
    hindex  : integer := 0 );
  port (
      rst     : in  std_logic;
      clk     : in  std_logic;
      ahbi   : in  ahb_mst_in_type;
      ahbo   : out ahb_mst_out_type; 
      haddr : in std_logic_vector (31 downto 0);
      hburst : in std_logic_vector(2 downto 0);
      hsize : in std_logic_vector (2 downto 0);
      htrans : in std_logic_vector (1 downto 0);
      hwdata : in std_logic_vector (31 downto 0);
      hwrite : in std_logic;
      hrdata : out std_logic_vector (31 downto 0);
      hready : out std_logic
      
);
end ahblite_bridge;

architecture struct of ahblite_bridge is
  
  
component state_machine is
 port (
    clk : in std_logic; -- Clock.
    reset : in std_logic; -- Synchronous reset.
    htrans : in std_logic_vector (1 downto 0);
    dmao : in ahb_dma_out_type;
    dmai : out ahb_dma_in_type;
    hready : out std_logic;
    haddr : in std_logic_vector (31 downto 0);
    hburst : in std_logic_vector(2 downto 0);
    hsize : in std_logic_vector (2 downto 0);
    hwdata : in std_logic_vector (31 downto 0);
    hwrite : in std_logic 
);
end component;


component ahbmst is
  generic (
    hindex  : integer := 0;
    hirq    : integer := 0;
    venid   : integer := VENDOR_GAISLER;
    devid   : integer := 0;
    version : integer := 0;
    chprot  : integer := 3;
    incaddr : integer := 0); 
   port (
      rst  : in  std_ulogic;
      clk  : in  std_ulogic;
      dmai : in ahb_dma_in_type;
      dmao : out ahb_dma_out_type;
      ahbi : in  ahb_mst_in_type;
      ahbo : out ahb_mst_out_type 
      );
end component;


component swapper is
    port (
        reset : in std_logic;
        dmao_data : in std_logic_vector (31 downto 0);
        hrdata : out std_logic_vector (31 downto 0)
        );
end component;


signal dmai : ahb_dma_in_type;
signal dmao : ahb_dma_out_type;


begin
  

end struct;


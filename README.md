## Project Title: Mitigating the Impact of Large Wood Debris on Bridges and Properties
## Brief Description
Large wood is defined as logs having length greater than 1m and diameter of at least 10cm (Gippel et al., 1996). Large wood is highly beneficial to nature. It enhances geomorphological diversity, regulates sediment transport, and provides critical habitat for aquatic fauna (Wohl, 2017). However, tree logs can become entrapped at in-channel structures such as bridge piers and then trap other large wood debris such as twigs and tree branches to form large accumulations (Diehl, 1997; Lagasse et al., 2010; Panici and de Almeida, 2018). 

During high flooding events, woods are transported downstream and can become entrapped at river crossings. These accumulations, called debris,  obstruct the channel flow, leading to increased upstream water levels, thereby causing significant damage to nearby bridges and properties.

This study focused on the design of upstream debris-retention systems (large wood catchers). This is a balanced approach as it safeguards the bridges and nearby properties by trapping hazardous wood loads during flooding. It also allows for the controlled reintroduction of wood for aquatic conservation purposes (Thomas and Nisbet, 2007).

## Study Area
The study focused on the River Torridge in Devon, England, a catchment characterised by significant riparian woodland (a type of woodland that grows along the banks of rivers, streams, and other watercourses) and a history of large wood (LW) transport. 

## Primary Spatial Data
The primary spatial data included the shapefile representing the river channel centreline (RiverTorridge.shp) and a dataset of road bridges in Devon (DevonBridges.csv). Additionally, a high-resolution Digital Terrain Model (DTM) for River Torridge(DTM_Torridge.tif) was also used for topographic analysis.

## Scripts
These are the R scripts for the Shiny app:
- App.R
- Global.R
- Server_Function.R
- Global.R

## How to Run the Shiny App
- Open RStudio
- Install required R packages if they are not installed already. Run this in the console:
  ```r
  install.packages(c("shiny", "leaflet", "sf", "raster", "ggplot2", "ggiraph", "RColorBrewer", "terra", "leafem"))

- Run the command below in the console when the packages have been installed: 
  ```r
  library("shiny")
  runGitHub("Large-Wood-Debris-Mitigation", "opeolumike")
- Wait a few seconds. The interactive map will display on your default browser
- You can turn on and off each layer on the map.

## Results
The spatial distribution of Large Wood (LW) across the River Torridge catchment was found to be non-random, exhibiting distinct patterns of accumulation rather than uniform dispersion.
To quantify this, a Kernel Density Estimation (KDE) was performed and a heatmap was generated. The heatmap highlights specific high-density zones called “hotspots”. The analysis indicates that the highest concentration of wood is located in the upstream of Rothern Bridge and Hatherleigh Bridge. These hotspots represent areas of significant large wood recruitment and retention(See Figure 1 below)

Topographic analysis derived from the DTM indicates that these high-density zones correlate strongly with the slope and aspect. Steep slopes were observed in proximity to LW hotspots. Furthermore, aspect analysis highlights that the river banks with the highest LW clusters predominantly face the prevailing wind direction.
This is supported by the result of the Tree Cover Ratio analysis done in RStudio, which confirms that high-risk reaches align with upstream zones of dense riparian woodland, validating that there are lots of trees nearby.

The proximity analysis identified immediate threats to bridges. The Distance to Nearest Hub analysis highlights specific bridges, notably Rothern Bridge and Hatherleigh Bridge, located downstream of significant LW clusters. This confirms that these bridges are high-priority assets, as they combine proximity to existing jams with a high potential for future recruitment from upstream vegetation.

## Conclusion 
The spatial analysis confirms that putting a strategy to intercept large wood upstream is both necessary for protecting the bridges and properties. By adhering to the Panici and Kripakaran (2021) design principles, the proposed Large Wood (LW) catchers will effectively prevent the large wood debris from causing damage to lives and properties.

## References
Benn, J. (2013) ‘Railway bridge failure during flooding in the UK and Ireland’, Proceedings of the Institution of Civil Engineers - Forensic Engineering, 166(4), pp. 163–170.

Diehl, T.H. (1997) Potential drift accumulation at bridges. USGS. 95, p. 95.

Gippel, C.J., Finlayson, B.L. and O'Neill, I.C. (1996) ‘Distribution and hydraulic significance of large woody debris in a lowland Australian river’, Hydrobiologia, 318(3), pp. 179–194.

Lagasse, P.F., Zevenbergen, L.W. and Clopper, P.E. (2010) ‘Impacts of debris on bridge pier scour’, in Scour and erosion, pp. 854–863.

Panici, D. and de Almeida, G.A. (2018) ‘Formation, growth, and failure of debris jams at bridge piers’, Water Resources Research, 54(9), pp. 6226–6241.

Panici, D. and Kripakaran, P. (2021) ‘Trapping large wood debris in rivers: Experimental study of novel debris retention system’, Journal of Hydraulic Engineering, 147(3), p. 04020101.

Panici, D., Kripakaran, P., Djordjević, S. and Dentith, K. (2020) ‘A practical method to assess risks from large wood debris accumulations at bridge piers’, Science of the Total Environment, 728, p. 138575.

Thomas, H. and Nisbet, T. (2012) ‘Modelling the hydraulic impact of reintroducing large woody debris into watercourses’, Journal of Flood Risk Management, 5(2), pp. 164–174.

Wohl, E. (2017) ‘Bridging the gaps: An overview of wood across time and space in diverse rivers’, Geomorphology, 279, pp. 3–26.




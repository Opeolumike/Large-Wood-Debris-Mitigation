output$map <- renderLeaflet({
  
  # Define color scales for slope, aspect and heatmap based on their specific data ranges
  pal_heatmap <- colorNumeric(palette = "inferno", domain = na.omit(values(heatmap)), na.color = "transparent")
  pal_aspect <- colorNumeric(palette = "Spectral", domain = c(0, 360), na.color = "transparent")
  pal_slope <- colorNumeric("YlOrRd", domain = na.omit(values(slope)), na.color = "transparent")
  
  leaflet() %>% 
    
    # Set initial view
    setView(lng = -4.200000, lat = 51.050000, zoom = 10) %>%
    
    # Base tiles
    addProviderTiles(providers$OpenStreetMap, group = "Colour") %>%
    
    
    addPolylines(
      data = river,
      color = "#FF00FF",      
      weight = 3,         
      opacity = 0.8,
      group = "River Torridge",
      highlightOptions = highlightOptions(bringToFront = TRUE)
    ) %>%
    
    # Add Bridges
    addCircleMarkers(
      data = bridges,
      color = "#000000",
      fillColor = "#A020F0",
      fillOpacity = 1,
      weight = 2,
      radius = 4,
      group = "Bridges"
    ) %>%
    
    # Add Large Wood Catchers
    addCircleMarkers(
      data = catchers,
      color = "#000000",
      fillColor = "#FFA800",
      fillOpacity = 1,
      weight = 2,
      radius = 6,
      group = "LW Catchers"
    ) %>%
    
    # Add Clusters
    addCircleMarkers(
      data = clusters,
      color = "#000000",
      fillColor = ~pal_clusters(CLUSTER_ID),
      fillOpacity = 0.6,
      radius = 6,
      group = "LW Clusters",
      popup = ~paste("Cluster ID:", CLUSTER_ID)
    ) %>%
    
    # Add Nearest Distance lines
    addPolylines(
      data = nearest_distance,
      color = "#0000FF",
      weight = 3,
      opacity = 0.7,
      group = "Nearest Distance"
    ) %>%
    
    # Add Heatmap raster
    addRasterImage(
      heatmap,
      colors = pal_heatmap,
      opacity = 0.7,
      group = "Heatmap"
    ) %>%
    
    # Add Slope raster
    addRasterImage(
      slope,
      colors = colorNumeric("YlOrRd", values(slope), na.color = "transparent"),
      opacity = 0.7,
      group = "Slope"
    ) %>%
    
    # Add Aspect raster
    addRasterImage(
      aspect,
      colors = pal_aspect, # Changed from "viridis" to match your legend
      opacity = 0.7,
      group = "Aspect"
    ) %>%
    
    # Add the Legend for the Aspect
    addLegend(
      pal = pal_aspect, 
      values = c(0, 360),
      title = "Aspect (Degrees)",
      position = "bottomleft",
      labFormat = labelFormat(suffix = "°"),
      group = "Aspect" 
    ) %>%
    
    # Add the Legend for the Slope
    addLegend(
      pal = pal_slope, 
      values = values(slope),
      title = "Slope (Degrees)",
      position = "bottomleft",
      group = "Slope"
    ) %>%
    
    # Add the Legend for the Heatmap
    addLegend(
      pal = pal_heatmap, 
      values = values(heatmap),
      title = "Heatmap",
      position = "bottomleft",
      group = "Heatmap"
    ) %>%
    
    # Add Layer control
    addLayersControl(
      baseGroups = c("OpenStreetMap"),
      overlayGroups = c(
        "River Torridge",
        "Bridges",
        "LW Clusters",
        "Heatmap",
        "Nearest Distance",
        "LW Catchers",
        "Aspect",
        "Slope"
      ),
      options = layersControlOptions(collapsed = FALSE)
    ) %>%
    
    # Hide all overlay groups except River Torridge initially when loaded until they are ticked
    hideGroup(c(
      "Bridges",
      "LW Clusters",
      "Heatmap",
      "Nearest Distance",
      "LW Catchers",
      "Aspect",
      "Slope"
    ))
})

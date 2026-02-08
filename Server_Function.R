output$map <- renderLeaflet({
  leaflet() %>% 
    # Set initial view
    setView(lng = -4.200000, lat = 51.050000, zoom = 9.3) %>%
    
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
      colors = colorNumeric("viridis", values(aspect), na.color = "transparent"),
      opacity = 0.7,
      group = "Aspect"
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

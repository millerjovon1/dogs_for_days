import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl'

// Connects to data-controller="map"
export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10"
    })

    this.#addMarkersToMap()

    #addMarkersToMap() {
      this.markersValue.forEach((marker) => {
        // Create a popup
        const popup = new mapboxgl.Popup().setHTML(marker.popup_html)

        // Create a custom marker
        const customMarker = document.createElement("div")
        customMarker.innerHTML = marker.marker_html

        new mapboxgl.Marker(customMarker)
          .setLngLat([ marker.lng, marker.lat ])
          .setPopup(popup)
          .addTo(this.map)
      })
    }
    
  }
}

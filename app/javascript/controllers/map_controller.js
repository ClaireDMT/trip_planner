import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {
    apiKey: String,
    rentalMarkers: Array,
    lodgingMarkers: Array,
    placeMarkers: Array,
  }


  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10"
    })
    this.#addMarkersToMap()
    const markers = this.rentalMarkersValue.concat(this.placeMarkersValue, this.lodgingMarkersValue)
    this.#fitMapToMarkers(markers)

  }

  #addMarkersToMap() {
    const bedIcon = '<svg xmlns="http://www.w3.org/2000/svg" width="34px" height="45px" viewBox="-20 -20 424 552"><path d="M172.268 501.67C26.97 291.031 0 269.413 0 192 0 85.961 85.961 0 192 0s192 85.961 192 192c0 77.413-26.97 99.031-172.268 309.67-9.535 13.774-29.93 13.773-39.464 0z" fill="#7045af" stroke-width="40" stroke="#fff"/><path d="M135.75 192c17.23046875 0 31.25-14.01953125 31.25-31.25s-14.01953125-31.25-31.25-31.25-31.25 14.01953125-31.25 31.25 14.01953125 31.25 31.25 31.25z m137.5-50H185.75c-3.453125 0-6.25 2.796875-6.25 6.25v56.25H92V123.25c0-3.453125-2.796875-6.25-6.25-6.25H73.25C69.796875 117 67 119.796875 67 123.25v137.5c0 3.453125 2.796875 6.25 6.25 6.25h12.5c3.453125 0 6.25-2.796875 6.25-6.25v-18.75h200v18.75c0 3.453125 2.796875 6.25 6.25 6.25h12.5c3.453125 0 6.25-2.796875 6.25-6.25V185.75c0-24.1640625-19.5859375-43.75-43.75-43.75z" fill="#fff"/></svg>'
    this.rentalMarkersValue.forEach((marker) => {
      new mapboxgl.Marker(this.#createMarker(bedIcon))
        .setLngLat([ marker.lng, marker.lat ])
        .addTo(this.map)
    })

    this.placeMarkersValue.forEach((marker) => {
      new mapboxgl.Marker(this.#createMarker(bedIcon))
        .setLngLat([ marker.lng, marker.lat ])
        .addTo(this.map)
    })

    this.lodgingMarkersValue.forEach((marker) => {
      new mapboxgl.Marker(this.#createMarker(bedIcon))
        .setLngLat([ marker.lng, marker.lat ])
        .addTo(this.map)
    })
  }

  #fitMapToMarkers(markers) {
    console.log(markers)
    const bounds = new mapboxgl.LngLatBounds()
    markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }

  #createMarker(svg) {
    const customMarker = document.createElement("div")
    customMarker.className = "marker"
    customMarker.innerHTML = svg
    //customMarker.style.backgroundImage = `url('${marker.image_url}')`
    //customMarker.style.backgroundSize = "contain"
    customMarker.style.width = "25px"
    customMarker.style.height = "25px"
    return customMarker
  }
}

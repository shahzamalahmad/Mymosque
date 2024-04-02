document.addEventListener("DOMContentLoaded", function() {
  var map = L.map("map").setView([<%= @location.latitude %>, <%= @location.longitude %>], 13);

  L.tileLayer("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", {
    attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors',
    maxZoom: 18
  }).addTo(map);

  L.marker([<%= @location.latitude %>, <%= @location.longitude %>]).addTo(map)
    .bindPopup("<%= j @location.name %>").openPopup();
});

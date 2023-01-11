// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import AddressAutocompleteController from "./address_autocomplete_controller"
application.register("address-autocomplete", AddressAutocompleteController)

import FlatpickrController from "./flatpickr_controller"
application.register("flatpickr", FlatpickrController)

import HelloController from "./hello_controller"
application.register("hello", HelloController)

import MapController from "./map_controller"
application.register("map", MapController)

import TabsController from "./tabs_controller"
application.register("tabs", TabsController)

import ToggleMapController from "./toggle_map_controller"
application.register("toggle-map", ToggleMapController)

import TogglePackedController from "./toggle_packed_controller"
application.register("toggle-packed", TogglePackedController)

import ScrollTo from 'stimulus-scroll-to'
application.register('scroll-to', ScrollTo)

import Reveal from 'stimulus-reveal-controller'
application.register('reveal', Reveal)

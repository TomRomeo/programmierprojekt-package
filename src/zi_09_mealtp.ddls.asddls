@AbapCatalog.sqlViewName: 'ZI09MEALTP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Transactional View Meal'
@VDM.viewType: #TRANSACTIONAL
define view ZI_09_MEALTP
  as select from ZI_09_MEAL
  association [0..*] to ZI_09_FlightTP as _Flight on $projection.CarrierID = _Flight.CarrierID
  association [0..*] to ZI_09_ConnectionTP as _Connection on $projection.CarrierID = _Connection.CarrierID
{
  key CarrierID,
  key Mealnumber,
  key Sprache,
      Text,
      @ObjectModel.association.type: [#TO_COMPOSITION_PARENT]
      _Flight,
      @ObjectModel.association.type: [#TO_COMPOSITION_PARENT, #TO_COMPOSITION_ROOT]
      _Connection
}

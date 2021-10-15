@AbapCatalog.sqlViewName: 'ZC09MEALTP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Consumption View Meal'
@VDM.viewType: #CONSUMPTION
@Metadata.allowExtensions: true

@ObjectModel: {
    //transactionalProcessingDelegated: true,

    createEnabled: true,
    updateEnabled: true,
    deleteEnabled: true
}

define view ZC_09_MEALTP
  as select from ZI_09_MEALTP
  association [0..*] to ZC_09_FlightTP as _Flight on $projection.CarrierID = _Flight.CarrierID
  association [0..*] to ZC_09_ConnectionTP as _Connection on $projection.CarrierID = _Connection.CarrierID
  
{
  key CarrierID,
  key Mealnumber,
  key Sprache,
      Text,
      @ObjectModel.association.type: [#TO_COMPOSITION_PARENT, #TO_COMPOSITION_ROOT, #TO_COMPOSITION_CHILD]
      _Flight,
      @ObjectModel.association.type: [#TO_COMPOSITION_PARENT, #TO_COMPOSITION_ROOT, #TO_COMPOSITION_CHILD]
      _Connection
}

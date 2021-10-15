@AbapCatalog.sqlViewName: 'ZC09CONN'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Consumption View Connection'
@VDM.viewType: #CONSUMPTION
@Metadata.allowExtensions: true

@ObjectModel:{
    //transactionalProcessingDelegated: true,
    
    createEnabled: true,
    updateEnabled: true,
    deleteEnabled: true
}
define view ZC_09_ConnectionTP
  as select from ZI_09_ConnectionTP
  association [0..*] to ZC_09_FlightTP as _Flight on  $projection.CarrierID    = _Flight.CarrierID
                                                  and $projection.ConnectionID = _Flight.ConnectionID
  association [0..*] to ZC_09_MEALTP as _Meal on $projection.CarrierID = _Meal.CarrierID
                                                  
{
  key CarrierID,
  key ConnectionID,
      CountryFrom,
      CityFrom,
      AirportFrom,
      CountryTo,
      CityTo,
      AirportTo,
      //FlightTime,
      DepartureTime,
      ArrivalTime,
      Distance,
      DistanceUnit,
      FlightType,
      Period,
      Header,
      Description,
      @ObjectModel.association.type: [#TO_COMPOSITION_CHILD]
      _Flight,
      @ObjectModel.association.type: [#TO_COMPOSITION_CHILD]
      _Meal
}

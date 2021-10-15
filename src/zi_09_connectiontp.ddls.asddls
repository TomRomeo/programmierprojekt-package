@AbapCatalog.sqlViewName: 'ZI09CONNTP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Transactional View Connection'
@VDM.viewType: #TRANSACTIONAL

/*@ObjectModel:{
    transactionalProcessingEnabled: true,
    compositionRoot: true,
    //writeActivePersistence: '',
    
    modelCategory: #BUSINESS_OBJECT,
    representativeKey: ['CarrierID', 'ConnectionID'],
    semanticKey: ['CarrierID', 'ConnectionID'],
    
    createEnabled: true,
    updateEnabled: true,
    deleteEnabled: true
}*/

define view ZI_09_ConnectionTP
  as select from ZI_09_Connection
  association [0..*] to ZI_09_FlightTP as _Flight on  $projection.CarrierID    = _Flight.CarrierID
                                                  and $projection.ConnectionID = _Flight.ConnectionID
  association [0..*] to ZI_09_MEALTP as _Meal on $projection.CarrierID = _Meal.CarrierID
{
  key CarrierID,
  key ConnectionID,
      CountryFrom,
      CityFrom,
      AirportFrom,
      CountryTo,
      CityTo,
      AirportTo,
      FlightTime,
      DepartureTime,
      ArrivalTime,
      @Semantics.quantity.unitOfMeasure: 'DistanceUnit'
      Distance,
      @Semantics.unitOfMeasure: true
      DistanceUnit,
      FlightType,
      Period,
      concat_with_space(concat(concat_with_space('From', AirportFrom, 1), concat_with_space(',', CityFrom, 1)), concat(concat_with_space('to', AirportTo, 1), concat_with_space(',', CityTo, 1)), 1) as Header,
      concat_with_space(concat_with_space('via', concat_with_space('Airline', CarrierID, 1), 1), concat_with_space('as', concat_with_space('Connection', ConnectionID, 1), 1), 1) as Description,
      @ObjectModel.association.type: [#TO_COMPOSITION_CHILD]
      _Flight,
      @ObjectModel.association.type: [#TO_COMPOSITION_CHILD]
      _Meal
}

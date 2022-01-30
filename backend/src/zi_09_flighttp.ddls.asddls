@AbapCatalog.sqlViewName: 'ZI09FLIGHTTP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Transactional View Flight'
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

define view ZI_09_FlightTP
  as select from ZI_09_Flight
  association [1]    to ZI_09_ConnectionTP as _Connection on  $projection.CarrierID    = _Connection.CarrierID
                                                          and $projection.ConnectionID = _Connection.ConnectionID
  association [0..*] to ZI_09_BookingTP    as _Booking    on  $projection.CarrierID    = _Booking.CarrierID
                                                          and $projection.ConnectionID = _Booking.ConnectionID
                                                          and $projection.FlightDate   = _Booking.FlightDate
  association [0..*] to ZI_09_MEALTP       as _Meal       on  $projection.CarrierID = _Meal.CarrierID
{
  key CarrierID,
  key ConnectionID,
  key FlightDate,
      @Semantics.amount.currencyCode: 'Currency'
      Price,
      @Semantics.currencyCode: true
      Currency,
      Planetype,
      @Semantics.amount.currencyCode: 'Currency'
      Paymentsum,

      SeatsmaxY,
      SeatsoccY,
      SeatsoccY2,
      case when SeatsmaxY <> 0 then division(SeatsoccY, SeatsmaxY, 4) else 1.00 end as OccupancyY,

      SeatsmaxB,
      SeatsoccB,
      SeatsoccB2,
      case when SeatsmaxB <> 0 then division(SeatsoccB, SeatsmaxB, 4) else 1.00 end as OccupancyB,

      SeatsmaxF,
      SeatsoccF,
      SeatsoccF2,
      case when SeatsmaxF <> 0 then division(SeatsoccF, SeatsmaxF, 4) else 1.00 end as OccupancyF,
      
      concat_with_space('On', FlightDate, 1) as Header,

      @ObjectModel.association.type: [#TO_COMPOSITION_PARENT, #TO_COMPOSITION_ROOT]
      _Connection,
      @ObjectModel.association.type: [#TO_COMPOSITION_CHILD]
      _Booking,
      @ObjectModel.association.type: [#TO_COMPOSITION_CHILD]
      _Meal
}

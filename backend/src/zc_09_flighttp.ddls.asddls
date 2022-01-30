@AbapCatalog.sqlViewName: 'ZC09FLIGHTTP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Consumption View Flight'
@VDM.viewType: #CONSUMPTION
@Metadata.allowExtensions: true

@ObjectModel:{
    //transactionalProcessingDelegated: true,

    createEnabled: true,
    updateEnabled: true,
    deleteEnabled: true
}

define view ZC_09_FlightTP
  as select from ZI_09_FlightTP
  association [1]    to ZC_09_ConnectionTP as _Connection on  $projection.CarrierID    = _Connection.CarrierID
                                                          and $projection.ConnectionID = _Connection.ConnectionID
  association [0..*] to ZC_09_BookingTP    as _Booking    on  $projection.CarrierID    = _Booking.CarrierID
                                                          and $projection.ConnectionID = _Booking.ConnectionID
                                                          and $projection.FlightDate   = _Booking.FlightDate
  association [0..*] to ZC_09_MEALTP       as _Meal       on  $projection.CarrierID = _Meal.CarrierID
{
  key CarrierID,
  key ConnectionID,
  key FlightDate,
      Price,
      Currency,
      Planetype,
      Paymentsum,
      SeatsmaxY,
      SeatsoccY,
      SeatsoccY2,
      OccupancyY,
      case  when OccupancyY = 1.00 then '1'  //negative
            when OccupancyY > 0.90 then '2'  //critical
            else '3'    end as CriticalityY, //positive
      SeatsmaxB,
      SeatsoccB,
      SeatsoccB2,
      OccupancyB,
      case  when OccupancyB = 1.00 then '1'
            when OccupancyB > 0.90 then '2'
            else '3'    end as CriticalityB,
      SeatsmaxF,
      SeatsoccF,
      SeatsoccF2,
      OccupancyF,
      case  when OccupancyF = 1.00 then '1'
            when OccupancyF > 0.90 then '2'
            else '3'    end as CriticalityF,
            
      Header,

      @ObjectModel.association.type: [#TO_COMPOSITION_PARENT,#TO_COMPOSITION_ROOT]
      _Connection,
      @ObjectModel.association.type: [#TO_COMPOSITION_CHILD]
      _Booking,
      @ObjectModel.association.type: [#TO_COMPOSITION_CHILD]
      _Meal
}

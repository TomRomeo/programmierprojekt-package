@AbapCatalog.sqlViewName: 'ZI09FLIGHT'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Interface View Flight'
@VDM.viewType: #BASIC
define view ZI_09_Flight
  as select from sflight
{
  key carrid     as CarrierID,
  key connid     as ConnectionID,
  key fldate     as FlightDate,
      price      as Price,
      currency   as Currency,
      planetype  as Planetype,
      paymentsum as Paymentsum,
      seatsmax   as SeatsmaxY,
      seatsocc   as SeatsoccY,
      seatsocc   as SeatsoccY2,
      seatsmax_b as SeatsmaxB,
      seatsocc_b as SeatsoccB,
      seatsocc_b as SeatsoccB2,
      seatsmax_f as SeatsmaxF,
      seatsocc_f as SeatsoccF,
      seatsocc_f as SeatsoccF2
}

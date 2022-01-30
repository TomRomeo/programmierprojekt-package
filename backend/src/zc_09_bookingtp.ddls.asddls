@AbapCatalog.sqlViewName: 'ZC09BOOKTP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Consumption View Booking'
@VDM.viewType: #CONSUMPTION
@Metadata.allowExtensions: true

@ObjectModel: {
    //transactionalProcessingDelegated: true,

    createEnabled: true,
    updateEnabled: true,
    deleteEnabled: true
}
define view ZC_09_BookingTP
  as select from ZI_09_BookingTP
  association [1] to ZC_09_FlightTP   as _Flight   on  $projection.CarrierID    = _Flight.CarrierID
                                                   and $projection.ConnectionID = _Flight.ConnectionID
                                                   and $projection.FlightDate   = _Flight.FlightDate
  association [1] to ZC_09_CUSTOMERTP as _Customer on  $projection.CustomerID = _Customer.ID

{
  key CarrierID,
  key ConnectionID,
  key FlightDate,
  key BookingID,
      CustomerID,
      CustomerType,
      IsSmoker,
      LuggageWeight,
      WeightUnit,
      Invoice,
      FlightClass,
      Amount,
      Currency,
      OrderDate,
      Counter,
      Agencynum,
      IsCancelled,
      Reserved,
      Passname,
      Passform,
      Passbirth,
      FormName,
      @ObjectModel.association.type: [#TO_COMPOSITION_PARENT, #TO_COMPOSITION_ROOT]
      _Flight,
      @ObjectModel.association.type: [#TO_COMPOSITION_CHILD, #TO_COMPOSITION_PARENT]
      _Customer
}

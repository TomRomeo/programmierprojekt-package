@AbapCatalog.sqlViewName: 'ZI09BOOKTP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Transactional View Booking'
@VDM.viewType: #TRANSACTIONAL
/*
@ObjectModel: {
//  transactionalProcessingEnabled: true,
//  compositionRoot: true,
//  writeActivePersistence: ''

    createEnabled: true,
    updateEnabled: true,
    deleteEnabled: true
}*/

define view ZI_09_BookingTP
  as select from ZI_09_Booking
  association [1] to ZI_09_FlightTP   as _Flight   on  $projection.CarrierID    = _Flight.CarrierID
                                                   and $projection.ConnectionID = _Flight.ConnectionID
                                                   and $projection.FlightDate   = _Flight.FlightDate
  association [1] to ZI_09_CUSTOMERTP as _Customer on  $projection.CustomerID   = _Customer.ID
{
  key CarrierID,
  key ConnectionID,
  key FlightDate,
  key BookingID,
      CustomerID,
      case when CustomerType = 'B' then 'Business'
           when CustomerType = 'P' then 'Privat'
           else 'unknown' end as CustomerType,
      IsSmoker,
      @Semantics.quantity.unitOfMeasure: 'WeightUnit'
      round(LuggageWeight, 2) as LuggageWeight,
      @Semantics.unitOfMeasure: true
      WeightUnit,
      Invoice,
    
      case when FlightClass = 'Y' then 'Economy Class'
           when FlightClass = 'C' then 'Business Class'
           when FlightClass = 'F' then 'First Class'
           else 'unknown' end as FlightClass,
      
      @Semantics.amount.currencyCode: 'Currency'
      Amount,
      @Semantics.currencyCode: true
      Currency,
      OrderDate,
      Counter,
      Agencynum,
      IsCancelled,
      Reserved,
      Passname,
      Passform,
      Passbirth,
      concat_with_space(Passform, Passname, 1) as FormName,
      @ObjectModel.association.type: [#TO_COMPOSITION_PARENT, #TO_COMPOSITION_ROOT]
      _Flight,
      @ObjectModel.association.type: [#TO_COMPOSITION_CHILD]
      _Customer
}

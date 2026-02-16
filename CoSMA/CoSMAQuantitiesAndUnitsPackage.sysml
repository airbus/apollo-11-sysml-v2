//
// Copyright (c) 2026 AIRBUS and its affiliates.
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.
//

library package CoSMAQuantitiesAndUnitsPackage {
	
	private import NumericalFunctions::*;
	private import ISQ::*;
	private import SI::*;
	private import MeasurementReferences::*;
	private import Quantities::*;
	private import Base::DataValue;
	
	attribute def RatioValue :> MeasurementReferences::DimensionOneValue {
		doc /* Quantity of dimension one value that represents a ratio */
		attribute :>> num: ScalarValues::Real;
		attribute :>> mRef: RatioUnit;
	}

	attribute ratio : RatioValue nonunique :> Quantities::scalarQuantities;
	attribute def RatioUnit :> MeasurementReferences::DimensionOneUnit;

	attribute <'%'> 'per cent' : RatioUnit {
		attribute :>> unitConversion {
			attribute :>> conversionFactor = RationalFunctions::rat(1, 100);
		}
	}

	attribute <'m³⋅s⁻²'> 'metre to the power 3 second to the power minus 2' : SimpleUnit;

	attribute <kN> kilonewton : ForceUnit { :>> unitConversion: ConversionByPrefix { :>> prefix = kilo; :>> referenceUnit = N; } }
	attribute <kPa> kilopascal : PressureUnit { :>> unitConversion: ConversionByPrefix { :>> prefix = kilo; :>> referenceUnit = Pa; } }
	attribute <MN> meganewton : ForceUnit { :>> unitConversion: ConversionByPrefix { :>> prefix = mega; :>> referenceUnit = N; } }
	attribute <gn> standardgravity : AccelerationUnit {:>> unitConversion: ConversionByConvention { :>> referenceUnit = 'm⋅s⁻²'; :>> conversionFactor = 9.80665; :>> isExact = false; }}
	attribute <fps> framespersecond : FrequencyUnit;
	attribute <kB> kilobyte : StorageCapacityUnit { :>> unitConversion: ConversionByPrefix { :>> prefix = kilo; :>> referenceUnit = B; } }
	attribute <yr> year : TimeUnit {:>> unitConversion: ConversionByConvention { :>> referenceUnit = 's'; :>> conversionFactor = 31536000; :>> isExact = false; }}

	attribute def CurrencyUnit :> SimpleUnit {
		private attribute currencyPF: QuantityPowerFactor[1] { :>> quantity = Currency; :>> exponent = 1; }
		attribute :>> quantityDimension { :>> quantityPowerFactors = currencyPF; }
	}

	attribute def CurrencyValue :> ScalarQuantityValue {
		doc
		/*
		* application domain: generic
		* name: Currency
		* measurement unit(s): $
		* tensor order: 0
		*/
		attribute :>> num: Real;
		attribute :>> mRef: CurrencyUnit[1];
	}

	attribute Currency: CurrencyValue[1]; 
	attribute currency: CurrencyValue[*] nonunique :> scalarQuantities;
	attribute <'$'> dollar : CurrencyUnit;
	attribute <'€'> euro : CurrencyUnit;

	attribute def SpecificImpulseValue :> ScalarQuantityValue {
		doc
		/*
		* application domain: rocket engineering
		* name: Specific Impulse
		* measurement unit(s): s
		* tensor order: 0
		*/
		attribute :>> num: Real;
		attribute :>> mRef: DurationUnit[1];
	}

	attribute SpecificImpulse: SpecificImpulseValue[1]; 
	attribute specificImpulse: SpecificImpulseValue[*] nonunique :> scalarQuantities;    

	calc <ln> naturalLogarithm { in x: DataValue[1]; in y: DataValue[1]; return : DataValue[1]; }
}
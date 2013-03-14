package cn.com.agilemaster

/**
 * Design
 * A domain class describes the data object and it's mapping to the database
 */
class Design extends Task {

    /* Default (injected) attributes of GORM */
//	Long	id
//	Long	version
    String designRequirement
    byte[] attached
    String delivery
    BigDecimal designFee
    String memo
    DesignCategory category

    Organization organization // Organizations involved in this design activity



    /* Automatic timestamping of GORM */
//	Date	dateCreated
//	Date	lastUpdated

//	static belongsTo	= []	// tells GORM to cascade commands: e.g., delete this object if the "parent" is deleted.
//	static hasOne		= []	// tells GORM to associate another domain object as an owner in a 1-1 mapping
//	static hasMany		= []	// tells GORM to associate other domain objects for a 1-n or n-m mapping
//	static mappedBy		= []	// specifies which property should be used in a mapping 

    static mapping = {
    }

    static constraints = {
        title size: 1..10
        delivery size: 1..10
        designRequirement( nullable: true)
        attached nullable: true
        organization nullable: true
        description nullable: true
        memo nullable: true
        designFee min: 0.0, max: 200000.0

        startDate (blank:false)
        endDate (blank:false, validator: {val,obj ->
            return val.after(obj.startDate)
        })
    }

    /*
      * Methods of the Domain Class
      */
//	@Override	// Override toString for a nicer / more descriptive UI 
	public String toString() {
		return "${title} ${category}";
	}
}
public enum DesignCategory {INTERIOR, INTELLIGENCE, INFORMATION, MUNICIPAL, LANDSCAPE, HOC /*hyperbaric oxygen chamber*/,
LINEAR_ACCELERATOR,  SEWAGE_TREATMENT, MARED_ORIENTED, HEMODIALYSIS, KITCHEN, DRINKING_WATER,
PURE_WATER, MEDICAL_GAS, OPERATING_ROOM, ICU, PROTECTIVE_DESIGN, CRL, /*center of reproductivie lab*/
}
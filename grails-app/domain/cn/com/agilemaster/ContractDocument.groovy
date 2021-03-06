package cn.com.agilemaster

/**
 * ContractDocument
 * A domain class describes the data object and it's mapping to the database
 */
class ContractDocument {

    /* Default (injected) attributes of GORM */
//	Long	id
//	Long	version

    String code
    String title
    String description
    String partyB
    String contact
    User author
    BigDecimal contractSum
    float paymentRatio
    Date signDate
    String contractType
    byte[] attachedFile
    String linkedFilePath

    /* Automatic timestamping of GORM */
    Date dateCreated
    Date lastUpdated

//	static belongsTo	= []	// tells GORM to cascade commands: e.g., delete this object if the "parent" is deleted.
//	static hasOne		= []	// tells GORM to associate another domain object as an owner in a 1-1 mapping
//	static hasMany		= []	// tells GORM to associate other domain objects for a 1-n or n-m mapping
//	static mappedBy		= []	// specifies which property should be used in a mapping 

    static mapping = {
    }

    static constraints = {
        code unique: true, blank: false
        title size: 1..100
        partyB size: 1..100, nullable: true
        contact size: 1..100, nullable: true
        contractSum nullable: false
        contractType shared: 'contractType'
        signDate()
        paymentRatio max: 100.00f, min: 0.00f, scale: 2 //percentage
        description size: 1..2000, nullable: true
        attachedFile(nullable: true)
        linkedFilePath(nullable: true)
        description(maxSize: 2000, nullable: true)
    }

    /*
      * Methods of the Domain Class
      */
//	@Override	// Override toString for a nicer / more descriptive UI 
    public String toString() {
        return "${title}";
    }
}

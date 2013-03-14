package cn.com.agilemaster

/**
 * BluePrintDocument
 * A domain class describes the data object and it's mapping to the database
 */
class BluePrintDocument extends Document{


    String category
    Organization organization
    Date submitDate
    Float versionNo
    String fileType
    Integer fileNo

    /* Default (injected) attributes of GORM */
//	Long	id
//	Long	version

    /* Automatic timestamping of GORM */
//	Date	dateCreated
//	Date	lastUpdated

//	static belongsTo	= []	// tells GORM to cascade commands: e.g., delete this object if the "parent" is deleted.
//	static hasOne		= []	// tells GORM to associate another domain object as an owner in a 1-1 mapping
//	static hasMany		= []	// tells GORM to associate other domain objects for a 1-n or n-m mapping
//	static mappedBy		= []	// specifies which property should be used in a mapping 


    /*
      * Methods of the Domain Class
      */
//	@Override	// Override toString for a nicer / more descriptive UI 
//	public String toString() {
//		return "${name}";
//	}

    static constraints = {
        title size: 1..10
        category size: 1..10
        organization nullable: true
        submitDate nullable: true
        versionNo nullable: true
        fileType nullable: true
        fileNo nullable: true
        linkedFilePath nullable: true
        attachedFile nullable: true
    }

}

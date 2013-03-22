package cn.com.agilemaster

/**
 * Document
 * A domain class describes the data object and it's mapping to the database
 */
class Document {

    /* Default (injected) attributes of GORM */
//	Long	id
//	Long	version

    String title
    String description

    User author

    /* Automatic timestamping of GORM */
	Date	dateCreated
	Date	lastUpdated

//	static belongsTo	= []	// tells GORM to cascade commands: e.g., delete this object if the "parent" is deleted.
//	static hasOne		= []	// tells GORM to associate another domain object as an owner in a 1-1 mapping
//	static hasMany		= []	// tells GORM to associate other domain objects for a 1-n or n-m mapping
//	static mappedBy		= []	// specifies which property should be used in a mapping

    String linkedFilePath /* the path of the file whose size exceeds 50MB */
    byte[] attachedFile


    static mapping = {
    }

    static constraints = {
        title size:1..20, blank: false
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

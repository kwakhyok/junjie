package cn.com.agilemaster

/**
 * UserProfile
 * A domain class describes the data object and it's mapping to the database
 */
class UserProfile {

    /* Default (injected) attributes of GORM */
//	Long	id
//	Long	version
    String  firstName
    String  lastName
    String  position
    String  telephone
    String  email
    String  fax
    String  memo
    boolean enabled
    byte[]  photo

    /* Automatic timestamping of GORM */
//	Date	dateCreated
//	Date	lastUpdated

	static belongsTo	= [user:User]	// tells GORM to cascade commands: e.g., delete this object if the "parent" is deleted.
//	static hasOne		= []	// tells GORM to associate another domain object as an owner in a 1-1 mapping
//	static hasMany		= []	// tells GORM to associate other domain objects for a 1-n or n-m mapping
//	static mappedBy		= []	// specifies which property should be used in a mapping 

    static mapping = {
    }

    static constraints = {
        firstName size: 1..10, blank: false
        lastName size: 1..10, blank: false
        position size: 1..10, blank: false
        telephone size: 1..15, blank: false
        email email: true
        fax nullable: true
        memo size: 0..100, nullable: true
        photo(maxSize: 1024*1024*10, nullable: true)

    }

    /*
      * Methods of the Domain Class
      */
//	@Override	// Override toString for a nicer / more descriptive UI 
	public String toString() {
		return "${lastName}${firstName}";
	}
}

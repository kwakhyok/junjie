package cn.com.agilemaster

/**
 * Work
 * A domain class describes the data object and it's mapping to the database
 */
class Work {

    /* Default (injected) attributes of GORM */
//	Long	id
//	Long	version
    String code
    String title
    String description
    Work parentWork
    /* Automatic timestamping of GORM */
//	Date	dateCreated
//	Date	lastUpdated

	static belongsTo	= [wbs:Workbreakdown]	// tells GORM to cascade commands: e.g., delete this object if the "parent" is deleted.
//	static hasOne		= []	// tells GORM to associate another domain object as an owner in a 1-1 mapping
	static hasMany		= [subWorks:Work]	// tells GORM to associate other domain objects for a 1-n or n-m mapping
	static mappedBy		= [subWorks: 'parentWork']	// specifies which property should be used in a mapping

    static mapping = {
        subWorks fetch: 'join'
    }

    static fetchMode = [subWorks: 'eager', parentWork:'eager']

    static constraints = {
        code  size:1..10, unique: true, blank:false
        title size: 1..10, blank: false
        description size: 1..1000, nullable: true
    }

    /*
      * Methods of the Domain Class
      */

    Work getRootWork(){
        if(parentWork) return parentWork.getRootWork()
        else return this
    }

    boolean isLeafWork(){
        return subWorks.isEmpty()
    }

    boolean isRootWork(){
        return !parentWork
    }

//	@Override	// Override toString for a nicer / more descriptive UI 
	public String toString() {
		return "${code} - ${title}";
	}


}

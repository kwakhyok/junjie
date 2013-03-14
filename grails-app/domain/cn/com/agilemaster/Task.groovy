package cn.com.agilemaster

/**
 * Task : A general class to describe the organization activity instance.
 * A domain class describes the data object and it's mapping to the database
 *
 */
 class Task {

    /* Default (injected) attributes of GORM */
//	Long	id
//	Long	version

    String title
    String description

    Date startDate
    Date endDate

  //  static TaskCategory  category = TaskCategory.GENERIC

    /* Automatic timestamping of GORM */
	Date	dateCreated
	Date	lastUpdated

	static belongsTo	= [project:Project]	// tells GORM to cascade commands: e.g., delete this object if the "parent" is deleted.
//	static hasOne		= []	// tells GORM to associate another domain object as an owner in a 1-1 mapping
	static hasMany		= [activities: Activity]	// tells GORM to associate other domain objects for a 1-n or n-m mapping
//	static mappedBy		= []	// specifies which property should be used in a mapping 

    static mapping = {
       sort 'dateCreated'
       activities sort: 'dateCreated'
    }

    static constraints = {
        description( nullable: true)
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
		return "${title}";
	}

}

public enum TaskCategory{BID_SECTION, INVESTMENT, PAYMENT, DESIGN, GENERIC}

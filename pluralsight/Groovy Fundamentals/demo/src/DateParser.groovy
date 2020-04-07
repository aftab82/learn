@Grab(group='joda-time', module='joda-time', version='2.10.5')
import org.joda.time.DateTime
import org.joda.time.format.DateTimeFormat

class DateParser {
    def String parse(time) {
        if (!time)
            throw new IllegalArgumentException()

        use(DateTimeCategory) {
            def printableItem = new DateTime(time)
            return printableItem.createPrintableTime()
        }

    }
}

package runningmapv2

import grails.converters.XML
import org.springframework.web.multipart.MultipartFile
import org.xml.sax.InputSource

import javax.xml.crypto.dsig.XMLObject

class RunData {
    @groovy.beans.Bindable
    Date datetime
    @groovy.beans.Bindable
    byte[] gpxData
    @groovy.beans.Bindable
    // UNCOMMENT AFTER DEBUGGING: Map parsedGPX = createParsedGpxData()
    Map parsedGPX = null

    String toString() {
        datetime.toString()
    }

    Map createParsedGpxData() {
        //If passed a gpx file, will return an array of maps with trkpt gpx entries in even array indices. Odd indices
        //contain xmlns extension entries.
        if(gpxData==null) {

            return null
        }
        else {

            def toStore = [:]
            def counter = 0;

            def xmlStr = new XmlParser().parseText(new String(this.gpxData, "UTF-8"))


            xmlStr.trk.trkseg.trkpt.each { trkpt ->


                toStore[counter++]=[lon: trkpt.'@lon', lat: trkpt.'@lat']
            }

            parsedGPX = toStore

            return toStore
        }
    }

   /* static def getTracks(trks) {
        def tracks = [];

        trks.each {trk->
            List<GPX> points = new ArrayList<GPS>();
            trk.trkseg.each { trkpt ->

            }
        }
    }*/


    static constraints = {

        datetime()
        parsedGPX nullable: true
        gpxData maxSize: 20000000

    }
}

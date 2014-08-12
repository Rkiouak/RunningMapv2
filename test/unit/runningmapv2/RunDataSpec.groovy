package runningmapv2

import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(RunData)
class RunDataSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

    void "test createParsedGpxData"() {

        when: "gpxData has xml file"

        String testString = '''<?xml version="1.0" encoding="UTF-8"?>
<gpx version="1.1" creator="WahooFitness" xsi:schemaLocation="http://www.topografix.com/GPX/1/1 http://www.topografix.com/GPX/1/1/gpx.xsd http://www.garmin.com/xmlschemas/GpxExtensions/v3 http://www.garmin.com/xmlschemas/GpxExtensionsv3.xsd http://www.garmin.com/xmlschemas/TrackPointExtension/v1 http://www.garmin.com/xmlschemas/TrackPointExtensionv1.xsd" xmlns="http://www.topografix.com/GPX/1/1" xmlns:gpxtpx="http://www.garmin.com/xmlschemas/TrackPointExtension/v1" xmlns:gpxx="http://www.garmin.com/xmlschemas/GpxExtensions/v3" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
 <metadata>
  <desc>GPX File Created by Fitness v4.2.4 (305) for iOS</desc>
  <link href="www.wahoofitness.com">
   <text>WahooFitness</text>
  </link>
  <time>2014-08-04T09:38:06Z</time>
 </metadata>
 <trk>
  <name>Untitled</name>
  <trkseg>
   <trkpt lon="-71.116520" lat="42.348301">
    <ele>12.481533</ele>
    <time>2014-08-04T09:38:06Z</time>
    <extensions>
     <gpxtpx:TrackPointExtension>
      <gpxtpx:hr>98</gpxtpx:hr>
     </gpxtpx:TrackPointExtension>
    </extensions>
   </trkpt>
   <trkpt lon="-71.116518" lat="42.348310">
    <ele>12.589919</ele>
    <time>2014-08-04T09:38:07Z</time>
    <extensions>
     <gpxtpx:TrackPointExtension>
      <gpxtpx:hr>98</gpxtpx:hr>
     </gpxtpx:TrackPointExtension>
    </extensions>
   </trkpt>
  </trkseg>
 </trk>
</gpx>'''


        def map = [:]
        map[0] = [ lon: "-71.116520", lat: "42.348301"]
        map[1] =  [lon: "-71.116518", lat:"42.348310"]

        then:  "createParsedGpxData pulls lon & lat into map"
        RunData runDataInstance = new RunData(gpxData: (testString as byte[]))

        runDataInstance.createParsedGpxData()

        assert(runDataInstance.parsedGPX[0] == map[0] && runDataInstance.parsedGPX[1] == map[1])


    }
}

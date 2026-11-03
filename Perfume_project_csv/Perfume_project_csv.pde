
Table fragranceData;
String[] perfumes;
int[] wears;

void setup() {
  size(1600, 1400);
  smooth();
  textAlign(CENTER, CENTER);

  fragranceData = loadTable("fragrances.csv", "header");

  // Count how many times each perfume appears
  java.util.HashMap<String, Integer> wearCounts =
    new java.util.HashMap<String, Integer>();

  for (TableRow row : fragranceData.rows()) {
    String perfume = row.getString("Perfume name");

    if (wearCounts.containsKey(perfume)) {
      wearCounts.put(perfume, wearCounts.get(perfume) + 1);
    } else {
      wearCounts.put(perfume, 1);
    }
  }

  // Create arrays using the spreadsheet data
  perfumes = wearCounts.keySet().toArray(new String[0]);
  wears = new int[perfumes.length];

  for (int i = 0; i < perfumes.length; i++) {
    wears[i] = wearCounts.get(perfumes[i]);
  }

  println("Spreadsheet records: " + fragranceData.getRowCount());
  println("Unique perfumes: " + perfumes.length);
}


void draw() {
  background(12, 12, 15);

  // Title
  fill(225, 190, 125);
  textSize(30);
  text("THE PERFUME PROJECT", width / 2-100, 35);


  // Gold divider
  stroke(170, 125, 65);
  line(300, 50, 1100, 50);


  // Draw the perfume bubbles
  for (int i = 0; i < perfumes.length; i++) {

    // Arrange bubbles in rows of five
float x = 180 + (i % 5) * 260;
float y = (i / 5) * 135 + 105;

    // Calculate bubble size from wear frequency
    float diameter = 35 + wears[i] * 18;


    // Main bubble
    fill(155, 105, 55);
    stroke(235, 195, 115);
    strokeWeight(1.5);
    ellipse(x, y, diameter, diameter);

    // Bubble label
    noStroke();
    fill(255);
    textSize(11);
    text(perfumes[i], x, y + diameter / 2 + 17);

String wearText;

if (wears[i] == 1) {
  wearText = "1 wear";
} else {
  wearText = wears[i] + " wears";
}

text(wearText, x, y + diameter / 2 + 34);
  }


}

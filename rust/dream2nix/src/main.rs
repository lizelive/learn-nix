// nice
fn main() -> Result<(), Box<dyn std::error::Error>> {
    // load and parse a json file
    let file = std::fs::File::open("data.json")?;
    let data: serde_json::Value = serde_json::from_reader(file)?;

    // pretty print the json to stdout
    println!("{}", serde_json::to_string_pretty(&data)?);
    Ok(())
}

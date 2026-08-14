use plotters::prelude::*;
use plotters::style::colors::FULL_COLOR_NAMES;
use std::collections::HashMap;
use std::error::Error;

pub fn create_line_chart(output_path: &str, title: &str, data: &[(f64, f64)]) -> Result<(), Box<dyn Error>> {
    let root = BitMapBackend::new(output_path, (1024, 768)).into_drawing_area();
    root.fill(&WHITE)?;
    let mut chart = ChartBuilder::on(&root)
        .caption(title, ("sans-serif", 50).into_font())
        .margin(5)
        .x_label_area_size(30)
        .y_label_area_size(30)
        .build_ranged(0.0..10.0, 0.0..10.0)?;

    chart.configure_mesh().draw()?;
    chart.draw_series(LineSeries::new(data.clone(), &RED))?;
    chart.draw_series(PointSeries::of_element(
        data.clone(),
        5,
        &RED,
        &|c, s, st| rect(c, st),
    ))?;
    root.present()?;
    Ok(())
}

pub fn create_bar_chart(output_path: &str, title: &str, data: &HashMap<&str, i32>) -> Result<(), Box<dyn Error>> {
    let root = BitMapBackend::new(output_path, (1024, 768)).into_drawing_area();
    root.fill(&WHITE)?;
    let mut chart = ChartBuilder::on(&root)
        .caption(title, ("sans-serif", 50).into_font())
        .margin(5)
        .x_label_area_size(30)
        .y_label_area_size(30)
        .build_cartesian_2d(0.0..(data.len() as f64), 0.0..*data.values().max().unwrap_or(&1) as f64)?;

    chart.configure_mesh().draw()?;
    let data_vec: Vec<_> = data.iter().collect();
    chart.draw_series(data_vec.iter().enumerate().map(|(i, (k, v))| {
        Rectangle::new(
            [((i as f64, 0.0), ((i as f64) + 1.0, *v as f64))],
            &FULL_COLOR_NAMES[i % FULL_COLOR_NAMES.len()],
        )
    }))?;
    root.present()?;
    Ok(())
}

fn rect(c: RGBColor, s: Size2D<i32>) -> Box<ShapeStyle> {
    Box::new(
        Rectangle::new([(-5, -5), (5, 5)], c.filled()).style(),
    )
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_create_line_chart() {
        let data: Vec<(f64, f64)> = (0..10).map(|x| (x as f64, (x * x) as f64)).collect();
        assert!(create_line_chart("line_chart.png", "Sample Chart", &data).is_ok());
    }
}

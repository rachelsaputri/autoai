// AnomalyDetector.ck - Module for identifying outliers in telemetry data
// Uses statistical methods (z-score approximation) to detect anomalies.

class AnomalyDetector {
    int anomaly_count;

    fun void init() {
        0 => anomaly_count;
    }

    fun boolean[] analyze(float data[]) {
        // Calculate mean
        float sum = 0.0;
        for (0 => int i; i < data.cap(); i++) {
            data[i] +> sum;
        }
        sum / data.cap() => float mean;

        // Calculate standard deviation
        float variance_sum = 0.0;
        for (0 => int i; i < data.cap(); i++) {
            float diff = data[i] - mean;
            diff * diff +> variance_sum;
        }
        variance_sum / data.cap() => float variance;
        Sqrt(variance) => float stddev;

        // Flag anomalies (points > 2 stddevs from mean)
        float[] anomaly_flags = new float[data.cap()];
        for (0 => int i; i < data.cap(); i++) {
            float diff = data[i] - mean;
            if (diff > 2.0 * stddev || diff < -2.0 * stddev) {
                1.0 => anomaly_flags[i];
                anomaly_count++;
            } else {
                0.0 => anomaly_flags[i];
            }
        }
        <<< "Anomalies Detected:", anomaly_count >>>;
        return anomaly_flags;
    }
}

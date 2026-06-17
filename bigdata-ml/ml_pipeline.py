import csv

def analyze_metrics(file_name):
    total_cpu = 0
    total_requests = 0
    count = 0
    critical_count = 0

    with open(file_name, "r") as file:
        reader = csv.DictReader(file)

        for row in reader:
            cpu = float(row["cpu_usage"])
            requests = int(row["requests"])
            status = row["status"]

            total_cpu += cpu
            total_requests += requests
            count += 1

            if status == "critical":
                critical_count += 1

    average_cpu = total_cpu / count
    average_requests = total_requests / count

    print("CloudOps Big Data + ML Pipeline Summary")
    print("--------------------------------------")
    print(f"Average CPU Usage: {average_cpu:.2f}%")
    print(f"Average Requests: {average_requests:.2f}")
    print(f"Critical Events Detected: {critical_count}")

    if average_cpu > 70:
        print("Prediction: High load expected. Scaling recommended.")
    elif average_cpu > 40:
        print("Prediction: Medium load expected. Monitor closely.")
    else:
        print("Prediction: System is healthy.")

analyze_metrics("cloudops_metrics.csv")

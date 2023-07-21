import csv

input_file = r'C:\temp\concilia_cp.csv'
output_file = r'C:\temp\arquivo_corrigido.csv'

def split_long_line(line, max_length):
    # Function to split a long line into multiple lines with a given maximum length
    return [line[i:i+max_length] for i in range(0, len(line), max_length)]

def fix_csv(input_file, output_file):
    with open(input_file, 'r', newline='') as csv_in:
        with open(output_file, 'w', newline='') as csv_out:
            reader = csv.reader(csv_in)
            writer = csv.writer(csv_out)

            for row in reader:
                # Join the elements of the row to form a single line
                line = ','.join(row)
                line_length = len(line)

                if line_length > 308:
                    # Split the long line into multiple lines
                    lines_to_write = split_long_line(line, 308)

                    # Write the split lines to the output file
                    for split_line in lines_to_write:
                        # Convert the split line back to a list and write it to the CSV file
                        writer.writerow(split_line.split(','))
                else:
                    # Write the line as it is if it doesn't need to be split
                    writer.writerow(row)

fix_csv(input_file, output_file)

"""read_log.py: Reads the microphone log & prints the average voltage"""

def main():
    file = 'microphone.log'
    print('Reading from', file)

    with open(file, 'r') as f:
        content = f.readlines()
        d, t = content.pop(0).split()[3:5] # date & time - not sure if useful
        data = []
        for line in content:
            try:
                data.append(float(line))
            except ValueError:
                ...
        avg = sum(data) / len(data)
        print('Average voltage:', avg)


if __name__ == '__main__':
    main()

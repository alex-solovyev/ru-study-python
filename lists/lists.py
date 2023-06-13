class ListExercise:
    @staticmethod
    def max(input_list: list[int]) -> int:
        max_item = input_list[0]
        for item in input_list[1::]:
            if item <= max_item:
                continue
            max_item = item

        return max_item

    @staticmethod
    def replace(input_list: list[int]) -> list[int]:
        if not input_list:
            return []

        max_item = ListExercise.max(input_list)

        return list(map(lambda item: max_item if item > 0 else item, input_list))

    @staticmethod
    def binary_search(input_list: list[int], query: int, left: int, right: int) -> int:
        if left > right:
            return -1

        middle = left + (right - left) // 2
        value = input_list[middle]

        if value == query:
            return middle

        if value > query:
            return ListExercise.binary_search(input_list, query, left, middle - 1)
        else:
            return ListExercise.binary_search(input_list, query, middle + 1, right)

    @staticmethod
    def search(input_list: list[int], query: int) -> int:
        left = 0
        right = len(input_list) - 1
        return ListExercise.binary_search(input_list, query, left, right)

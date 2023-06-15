from typing import Any, Callable, List, Tuple


class FilterMapExercise:
    @staticmethod
    def filter_map(func: Callable[[Any], Tuple[bool, Any]], input_array: List[Any]) -> List[Any]:
        return list(
            map(
                lambda item: item[1],
                filter(lambda item: item[0], map(lambda item: func(item), input_array)),
            )
        )

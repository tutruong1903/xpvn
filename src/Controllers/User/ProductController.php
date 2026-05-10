<?php

declare(strict_types=1);

namespace App\Controllers\User;

use App\Controllers\BaseController;
use App\Models\Order;
use App\Models\Product;
use Exception;
use Psr\Http\Message\ResponseInterface;
use Slim\Http\Response;
use Slim\Http\ServerRequest;
use function json_decode;

final class ProductController extends BaseController
{
    /**
     * @throws Exception
     */
    public function index(ServerRequest $request, Response $response, array $args): ResponseInterface
    {
        $tabps = (new Product())->where('status', '1')
            ->where('type', 'tabp')
            ->orderBy('id')
            ->get();

        $bandwidths = (new Product())->where('status', '1')
            ->where('type', 'bandwidth')
            ->orderBy('id')
            ->get();

        $times = (new Product())->where('status', '1')
            ->where('type', 'time')
            ->orderBy('id')
            ->get();

        $user           = $this->user;
        $userOrderCount = (new Order())->where('user_id', $user->id)->count();

        foreach ($tabps as $tabp) {
            $tabp->content = json_decode($tabp->content);
            $tabp->can_buy = $this->checkCanBuy(json_decode($tabp->limit), $user, $userOrderCount);
        }

        foreach ($bandwidths as $bandwidth) {
            $bandwidth->content = json_decode($bandwidth->content);
            $bandwidth->can_buy = $this->checkCanBuy(json_decode($bandwidth->limit), $user, $userOrderCount);
        }

        foreach ($times as $time) {
            $time->content = json_decode($time->content);
            $time->can_buy = $this->checkCanBuy(json_decode($time->limit), $user, $userOrderCount);
        }

        return $response->write(
            $this->view()
                ->assign('tabps', $tabps)
                ->assign('bandwidths', $bandwidths)
                ->assign('times', $times)
                ->fetch('user/product.tpl')
        );
    }

    private function checkCanBuy(?object $limit, object $user, int $userOrderCount): bool
    {
        if ($limit === null) {
            return true;
        }

        if (($limit->class_required ?? '') !== '' && $user->class < (int) $limit->class_required) {
            return false;
        }

        if (($limit->node_group_required ?? '') !== '' && $user->node_group !== (int) $limit->node_group_required) {
            return false;
        }

        if (($limit->new_user_required ?? 0) !== 0 && $userOrderCount > 0) {
            return false;
        }

        return true;
    }
}
